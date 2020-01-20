var fs = require('fs');
var path = require('path');
var _ = require("underscore")._;

var sourceDir = path.join(__dirname, '../sql/');
var functionDir = path.join(sourceDir, 'functions');
var tableDir = path.join(sourceDir, 'tables');
var indexesDir = path.join(sourceDir, 'indexes');
var globalsDir = path.join(sourceDir, 'globals');

const loadFiles = function(dir){
    let results = [];
    let files = fs.readdirSync(dir);
    if(files !== undefined){
        _.each(files, function(file){
            if(file.indexOf('.sql') > 0 ){
                let sql = fs.readFileSync(path.join(dir, file), {encoding: 'utf-8'});
                results.push(sql);
            }
        })
    }

    return results.join('\r\n');
};

const readInit = function(){
    const initFile = path.join(sourceDir, 'init.sql');
    return fs.readFileSync(initFile, {encoding: 'utf-8'});
};
function readFunctions(){
    return loadFiles(functionDir);
}

var readTables = function(){
    return loadFiles(tableDir);
}

function readIndexes(){
    return loadFiles(indexesDir);
}

function readGlobals(){
    return loadFiles(globalsDir);
}


exports.readSql = function(){
    var sqlBits = [];
    //sqlBits.push(`--Generated ${new Date()}`);
    sqlBits.push(readInit());
    sqlBits.push(readGlobals());
    sqlBits.push(readFunctions());
    sqlBits.push(readTables());
    sqlBits.push(readIndexes());
    console.log(sqlBits);
    return sqlBits.join('\r\n');
}