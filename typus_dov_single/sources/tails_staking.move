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

    struct NftExtension has key, store {
        id: UID,
        nft_table: ObjectTable<address, Tails>,
        nft_manager_cap: NftManagerCap,
        policy: TransferPolicy<Tails>,
        fee: Balance<SUI>,
    }

    struct Partner has key, store {
        id: UID,
        exp_allocation: u64,
        partner_traits: VecMap<String, String>,
    }

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
        // ...
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