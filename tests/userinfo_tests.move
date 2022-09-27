#[test_only]
module profile::user_info_tests{
    use std::string::utf8;
    use std::signer;
    use profile::user_info;
    use std::debug;
     use profile::user_profile;
    #[test(account=@0x42)]
    public entry fun test_get_and_set1 (account:signer){
        let username= b"anto56665";
        debug::print( &account);

        //   user_profile::set(&account, username);
        user_info::set_username(&account, username);
        let user_addr = signer::address_of(&account);
        assert!(user_info::get_username(user_addr)==utf8(username),1)
    } 
    #[test(account=@0x44)]

     public entry fun test_get_and_set2 (account:signer){
        let username= b"anto56665";
        debug::print( &account);
          user_profile::set(&account, username);
        // user_info::set_username(&account, username);
        let user_addr = signer::address_of(&account);
        assert!(user_profile::get(user_addr)==utf8(username),1)
    }
}