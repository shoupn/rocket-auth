const massive = require('massive');
const fs = require('fs');
const path = require('path');
const builder = require('../../lib/builder');

const helper = function(){

    async function getDb(){
        const db = await massive({
            host: '192.168.0.36',
            port: 5432,
            database: 'rocket-auth',
            user: 'appuser',
            password: 'apppwd'
          });
    
        return db;
    }
    

    
    async function init(){
        const sql = builder.readSql();
        let dbContext = await getDb();
        dbContext.query(sql).then(function(err, res){
            if(err){
                console.log(err);
            }
            else{
                console.log('success');
            }
        });
    };

    return {
        init: init
    }

};

module.exports = helper;

