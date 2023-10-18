module typus_framework::authority {
    use sui::linked_table::LinkedTable;

    #[allow(unused_field)]
    struct Authority has store {
        whitelist: LinkedTable<address, bool>,
    }
}