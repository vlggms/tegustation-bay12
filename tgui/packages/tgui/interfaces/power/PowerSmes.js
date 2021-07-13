import { useBackend } from 'tgui/backend';
import { AnimatedNumber, Box, Button, Flex, LabeledList, ProgressBar, Section, Slider } from 'tgui/components';
import { formatPower } from 'tgui/format';
import { Window } from 'tgui/layouts';

// Common power multiplier
const POWER_MUL = 1e6;

export const PowerSmes = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    nameTag,
    storedCapacity,
    storedCapacityAbs,
    storedCapacityMax,
    inputAttempt,
    inputting,
    inputLevel,
    inputLevelMax,
    inputAvailable,
    outputAttempt,
    outputting,
    outputLevel,
    outputLevelMax,
    outputUsed,
  } = data;
  const inputState = (
    storedCapacity >= 100 && 'good'
    || inputting && 'average'
    || 'bad'
  );
  const outputState = (
    outputting && 'good'
    || storedCapacity > 0 && 'average'
    || 'bad'
  );
  return (
    <Window
      width={340}
      height={350}>
      <Window.Content>
        <Section title="Stored Energy">
          <ProgressBar
            value={storedCapacity * 0.01}
            ranges={{
              good: [0.5, Infinity],
              average: [0.15, 0.5],
              bad: [-Infinity, 0.15],
            }} />
        </Section>
        <Section title="Input">
          <LabeledList>
            <LabeledList.Item
              label="Charge Mode"
              buttons={
                <Button
                  icon={inputAttempt ? 'sync-alt' : 'times'}
                  selected={inputAttempt}
                  onClick={() => act('try_input')}>
                  {inputAttempt ? 'Auto' : 'Off'}
                </Button>
              }>
              <Box color={inputState}>
                {storedCapacity >= 100 && 'Fully Charged'
                  || inputting && 'Charging'
                  || 'Not Charging'}
              </Box>
            </LabeledList.Item>
            <LabeledList.Item label="Target Input">
              <Flex inline width="100%">
                <Flex.Item>
                  <Button
                    icon="fast-backward"
                    disabled={inputLevel === 0}
                    onClick={() => act('input', {
                      target: 'min',
                    })} />
                  <Button
                    icon="backward"
                    disabled={inputLevel === 0}
                    onClick={() => act('input', {
                      adjust: -10000,
                    })} />
                </Flex.Item>
                <Flex.Item grow={1} mx={1}>
                  <Slider
                    value={inputLevel}
                    fillValue={inputAvailable}
                    minValue={0}
                    maxValue={inputLevelMax}
                    step={5000}
                    stepPixelSize={4}
                    format={value => formatPower(value, 0)}
                    onDrag={(e, value) => act('input', {
                      target: value,
                    })} />
                </Flex.Item>
                <Flex.Item>
                  <Button
                    icon="forward"
                    disabled={inputLevel === inputLevelMax}
                    onClick={() => act('input', {
                      adjust: 10000,
                    })} />
                  <Button
                    icon="fast-forward"
                    disabled={inputLevel === inputLevelMax}
                    onClick={() => act('input', {
                      target: 'max',
                    })} />
                </Flex.Item>
              </Flex>
            </LabeledList.Item>
            <LabeledList.Item label="Available">
              <AnimatedNumber
                value={inputAvailable}
                format={value => formatPower(value)} />
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Output">
          <LabeledList>
            <LabeledList.Item
              label="Output Mode"
              buttons={
                <Button
                  icon={outputAttempt ? 'power-off' : 'times'}
                  selected={outputAttempt}
                  onClick={() => act('try_output')}>
                  {outputAttempt ? 'On' : 'Off'}
                </Button>
              }>
              <Box color={outputState}>
                {outputting
                  ? 'Sending'
                  : storedCapacity > 0
                    ? 'Not Sending'
                    : 'No Charge'}
              </Box>
            </LabeledList.Item>
            <LabeledList.Item label="Target Output">
              <Flex inline width="100%">
                <Flex.Item>
                  <Button
                    icon="fast-backward"
                    disabled={outputLevel === 0}
                    onClick={() => act('output', {
                      target: 'min',
                    })} />
                  <Button
                    icon="backward"
                    disabled={outputLevel === 0}
                    onClick={() => act('output', {
                      adjust: -10000,
                    })} />
                </Flex.Item>
                <Flex.Item grow={1} mx={1}>
                  <Slider
                    value={outputLevel}
                    minValue={0}
                    maxValue={outputLevelMax}
                    step={5000}
                    stepPixelSize={4}
                    format={value => formatPower(value, 0)}
                    onDrag={(e, value) => act('output', {
                      target: value,
                    })} />
                </Flex.Item>
                <Flex.Item>
                  <Button
                    icon="forward"
                    disabled={outputLevel === outputLevelMax}
                    onClick={() => act('output', {
                      adjust: 10000,
                    })} />
                  <Button
                    icon="fast-forward"
                    disabled={outputLevel === outputLevelMax}
                    onClick={() => act('output', {
                      target: 'max',
                    })} />
                </Flex.Item>
              </Flex>
            </LabeledList.Item>
            <LabeledList.Item label="Outputting">
              <AnimatedNumber
                value={outputUsed}
                format={value => formatPower(value)} />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
