const builder = require('../../lib/builder');
const helper = require('./helper')
const mocha = require('mocha');
var assert = require('assert');

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
        assert(shelper.init , undefined|| null);
    });

    it('runs helper init', function(){
        assert(shelper.init());
    });

});