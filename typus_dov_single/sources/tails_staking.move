module typus_dov::tails_staking {
    use sui::sui::SUI;
    use sui::balance::Balance;
    use sui::object::{UID, ID};
    use sui::object_table::ObjectTable;
    use sui::transfer_policy::TransferPolicy;
    use sui::vec_map::VecMap;
    use std::string::String;

    use typus_dov::typus_dov_single::Registry;
    use typus_nft::typus_nft::{Tails, ManagerCap as NftManagerCap};

    #[allow(unused_field)]
    struct NftExtension has key, store {
        id: UID,
        nft_table: ObjectTable<address, Tails>,
        nft_manager_cap: NftManagerCap,
        policy: TransferPolicy<Tails>,
        fee: Balance<SUI>,
    }

    #[allow(unused_field)]
    struct Partner has key, store {
        id: UID,
        exp_allocation: u64,
        partner_traits: VecMap<String, String>,
    }

    #[allow(unused_field)]
    struct PartnerKey has key, store {
        id: UID,
        for: ID,
        partner: String,
    }

    public fun partner_add_exp(
        _registry: &mut Registry,
        _partner_key: &PartnerKey,
        _owner: address,
        _exp: u64,
    ) {
        // typus_dov_single::version_check(registry);
        // // E_INVALID_REGISTRY if not exists
        // assert!(dynamic_field::exists_(registry_uid(registry), b"nft_extension"), E_INVALID_REGISTRY);
        // let nft_extension: &mut NftExtension = dynamic_field::borrow_mut(registry_mut_uid(registry), b"nft_extension");
        // let nft_table = &mut nft_extension.nft_table;

        // let partner_mut: &mut Partner = dynamic_field::borrow_mut(&mut nft_extension.id, partner_key.partner);
        // assert!(&partner_key.for == object::borrow_id(partner_mut), E_KEY_MISMATCH);

        // if (object_table::contains(nft_table, owner)) {
        //     let nft = object_table::borrow_mut<address, Tails>(nft_table, owner);

        //     let keys = vec_map::keys(&partner_mut.partner_traits);
        //     let attributes = typus_nft::tails_attributes(nft);

        //     let pass = true;
        //     while (vector::length(&keys) > 0) {
        //         let key = vector::pop_back(&mut keys);
        //         let value = vec_map::get(&partner_mut.partner_traits, &key);
        //         let attribute = vec_map::get(&attributes, &key);
        //         if (attribute != value) { pass = false };
        //     };
        //     if (pass) {
        //         typus_nft::nft_exp_up(&nft_extension.nft_manager_cap, nft, exp);
        //         partner_mut.exp_allocation = partner_mut.exp_allocation - exp;
        //     }
        // }
    }

    // Helper Functions

    public fun has_staked(
        _registry: &Registry,
        _owner: address,
    ): bool {
        // ...
        true
    }
}