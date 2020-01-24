var assert = require("assert");
const helper = require('./helper')


function runRegistrationTests(db){

  describe('with valid creds', function(){
    var regResult=null;
    db.membership.register(['test1@test.com', 'password']).then(function(res,err){
      regResult=res[0];

      
      assert(regResult != null);
      assert(regResult.success);
      assert(regResult.new_id);
      // db.query("select count(1) from membership.users_roles where user_id=$1",[regResult.new_id]).then(function(res, err){
      //   assert.equal(res[0].count, 1);
      // });
      console.log(regResult);
    });


    it('returns a validation token', function(){
      assert(regResult.validation_token);
    });
    it('adds them to a role', function(done){
      db.run("select count(1) from membership.users_roles where user_id=$1",[regResult.new_id], function(err,res){
        assert.equal(res[0].count, 1);
        done();
      });
    });
  });
  describe('trying an existing user', function(){
    var regResult=null;
    before(function(done){
      db.membership.register(['test1@test.com', 'password'], function(err,res){
        regResult = res[0];
        done();
      });
    });
    it('is not successful', function(){
      assert.equal(false, regResult.success); 
    });
  });
};

module.exports = runRegistrationTests;