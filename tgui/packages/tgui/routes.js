/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

/**
 * Haven changelog
 *   DD/MM/YYYY
 *
 * - 13/04/2021: Migrate modifications to tgui 4.3
 * - 12/09/2020: Support interfaces in subdirs - martinlyra
 */

import { selectBackend } from './backend';
import { selectDebug } from './debug/selectors';
import { Window } from './layouts';

const requireInterface = require.context('./interfaces');

const routingError = (type, name) => () => {
  return (
    <Window>
      <Window.Content scrollable>
        {type === 'notFound' && (
          <div>Interface <b>{name}</b> was not found.</div>
        )}
        {type === 'missingExport' && (
          <div>Interface <b>{name}</b> is missing an export.</div>
        )}
      </Window.Content>
    </Window>
  );
};

const SuspendedWindow = () => {
  return (
    <Window>
      <Window.Content scrollable />
    </Window>
  );
};

export const getRoutedComponent = store => {
  const state = store.getState();
  const { suspended, config } = selectBackend(state);
  if (suspended) {
    return SuspendedWindow;
  }
  if (process.env.NODE_ENV !== 'production') {
    const debug = selectDebug(state);
    // Show a kitchen sink
    if (debug.kitchenSink) {
      return require('./debug').KitchenSink;
    }
  }
  const name = config?.interface;
  const interfacePathBuilders = [
    name => `./${name}.tsx`,
    name => `./${name}.js`,
    name => `./${name}/index.tsx`,
    name => `./${name}/index.js`,
  ];
  let esModule;
  while (!esModule && interfacePathBuilders.length > 0) {
    const interfacePathBuilder = interfacePathBuilders.shift();
    const interfacePath = interfacePathBuilder(name);
    try {
      esModule = requireInterface(interfacePath);
    }
    catch (err) {
      if (err.code !== 'MODULE_NOT_FOUND') {
        throw err;
      }
    }
  }
  if (!esModule) {
    return routingError('notFound', name);
  }
  // Haven modification to support interfaces in subdirs
  const Component = esModule[name.split('/').slice(-1)[0]];
  if (!Component) {
    return routingError('missingExport', name);
  }
  return Component;
};
