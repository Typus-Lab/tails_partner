module typus_framework::balance_pool {
    use std::type_name::TypeName;
    use sui::object::UID;
    use typus_framework::authority::Authority;

    struct BalancePool has key, store {
        id: UID,
        balance_infos: vector<BalanceInfo>,
        authority: Authority,
    }

    struct BalanceInfo has copy, drop, store {
        token: TypeName,
        value: u64,
    }
}