const reactHelper = require('reactHelper');

/** Register your components in this file **/
//const SomeComponent = require('./path/to/a/component');
//reactHelper.register({SomeComponent});

const Test = require('./components/testReact');
// Require all components you want to use in your views...


reactHelper.register({Test});

