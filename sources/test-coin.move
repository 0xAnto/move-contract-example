module profile::user_profile {
    use std::signer;
    use profile::user_info::{ set_username, get_username};
    use std::string::{String, utf8};
    struct UserProfile has key { username: String }

 public fun get(user_addr: address): String {
        // borrow_global<UserProfile>(user_addr).username
        get_username(user_addr)
    }
    public entry fun set (account: &signer, raw_username : vector<u8>){
         let _name = utf8(raw_username);
        let user_addr = signer::address_of(account);
         if(!exists<UserProfile>(user_addr)){
            set_username(account,  raw_username)
        } else{
            set_username(account, raw_username)
        }
    }
 }
