module profile::user_info{
    use std::string::{String, utf8};
    use std::signer;
    struct UserProfile has key { username: String }
    
    public fun get_username(user_addr: address): String acquires UserProfile {
        borrow_global<UserProfile>(user_addr).username
    }
    public entry fun set_username(account: &signer, raw_username : vector<u8>) acquires UserProfile{
        let name = utf8(raw_username);
        let user_addr = signer::address_of(account);
        if(!exists<UserProfile>(user_addr)){
            let user_info = UserProfile{username: name};
            move_to(account,user_info)
        } else{
            let existing_user_info = borrow_global_mut<UserProfile>(user_addr);
            existing_user_info.username=name

        }
    }
}