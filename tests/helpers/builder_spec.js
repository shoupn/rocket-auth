const builder = require('../../lib/builder');
const helper = require('./helper')
const mocha = require('mocha');
var assert = require('assert');
const registration = require('../helpers/registeer_spec');
describe('SQL Builder', function(){
    let sql = null;

    it('loads builder and function', function(){
        assert(builder);
        assert.ok(builder.readSql);
    });

    it('builder.readSql() is not null || undefined', function(){
        sql = builder.readSql();
        //console.log(sql)
        assert.notEqual(sql, undefined || null);
    });

    const shelper = helper();
    it('should test if helper has a function called init',function(){
        assert(shelper.initDb , undefined|| null);
    });

    it('runs helper init', function(){
        let context = null;
        assert(context = shelper.initDb());
        assert(context != null);
        context.then(function(db){
            registration(db);
        })
    });
  

});