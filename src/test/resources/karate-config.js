function fn() {
  var env = karate.env || 'dev';
  karate.log('Running environment:', env);

  var config = {
    env: env,
    connectTimeout: 5000,
    readTimeout: 5000,
  };

  config.baseUrl = 'http://localhost:3100/api';
  
  if (env === 'dev') {
    config.baseUrl = 'http://localhost:3100/api';
  } 
  // these urls would be different if multiple environments did exist
  else if (env === 'staging') {
    config.baseUrl = 'http://localhost:3100/api';
  } else if (env === 'prod') {
    config.baseUrl = 'http://localhost:3100/api';
  } else {
    karate.log('WARNING: Unknown environment "' + env + '", falling back to dev');
    config.baseUrl = 'http://localhost:3100/api';
  }

  karate.configure('connectTimeout', config.connectTimeout);
  karate.configure('readTimeout', config.readTimeout);

  return config;
}