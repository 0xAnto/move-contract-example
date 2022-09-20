#[test_only]
module sender::user_info_tests{
    use std::string::utf8;
    use std::signer;
    use sender::user_info;
    #[test(account=@0x42)]
    public entry fun test_get_and_set (account:signer){
        let username= b"anto";
        user_info::set_username(&account, username);
        let user_addr = signer::address_of(&account);
        assert!(user_info::get_username(user_addr)==utf8(username),1)
    }
}