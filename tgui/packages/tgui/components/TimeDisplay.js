import { toFixed } from 'common/math';
import { Component } from 'inferno';

// AnimatedNumber Copypaste
const isSafeNumber = value => {
  return typeof value === 'number'
    && Number.isFinite(value)
    && !Number.isNaN(value);
};

export class TimeDisplay extends Component {
  constructor(props) {
    super(props);
    this.timer = null;
    this.last_seen_value = undefined;
    this.state = {
      value: 0,
    };
    // Set initial state with value provided in props
    if (isSafeNumber(props.value)) {
      this.state.value = Number(props.value);
      this.last_seen_value = Number(props.value);
    }
  }

  shouldTick() {
    return this.props.auto !== undefined && this.props.auto !== "off";
  }

  isDisabled() {
    return this.props.disabled !== undefined && this.props.disabled;
  }

  componentDidUpdate() {
    if (this.shouldTick()) {
      clearInterval(this.timer);
      this.timer = setInterval(() => this.tick(), 100); // every .1 s
    }
  }

  tick() {
    let current = Number(this.state.value);
    if (this.props.value !== this.last_seen_value) {
      this.last_seen_value = this.props.value;
      current = this.props.value;
    }
    const mod = this.props.auto === "up" ? 1 : -1; // Time down by default.
    const value = Math.max(0, current + mod); // one deci-sec tick
    this.setState({ value });
  }

  componentDidMount() {
    if (this.shouldTick()) {
      this.timer = setInterval(() => this.tick(), 100); // every .1 s
    }
  }

  componentWillUnmount() {
    clearInterval(this.timer);
  }

  render() {
    const { props, state } = this;
    const { format } = props;
    const val = this.state.value;
    let seconds, minutes, hours;
    if (!this.isDisabled()) {
      // Directly display weird stuff
      if (!isSafeNumber(val)) {
        return this.state.value || null;
      }
      // THERE IS AS YET INSUFFICIENT DATA FOR A MEANINGFUL ANSWER
      // HH:MM:SS
      // 00:02:13
      seconds = toFixed(Math.floor((val/10) % 60)).padStart(2, "0");
      minutes = toFixed(Math.floor((val/(10*60)) % 60)).padStart(2, "0");
      hours = toFixed(Math.floor((val/(10*60*60)) % 24)).padStart(2, "0");
    } else {
      seconds = minutes = hours = '--';
    }
    let formattedValue;
    if (format)
    { formattedValue = format(hours, minutes, seconds); }
    else
    { formattedValue = `${hours}:${minutes}:${seconds}`; }
    return formattedValue;
  }
}
