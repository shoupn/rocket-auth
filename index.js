const program = require('commander');

program
    .command('build')
    .description('build SQL files for our project')
    //.option("-s, --setup_mode [mode]", "Which setup mode to use")
    .action(function(){
        console.log('building now...');
    });

program
    .command('install [env]')
    .description('build SQL files for our project')
    //.option("-s, --setup_mode [mode]", "Which setup mode to use")
    .action(function(env){
        const target = env || "development";
        console.log(`installing into ${target}`);
    });

  program.parse(process.argv);