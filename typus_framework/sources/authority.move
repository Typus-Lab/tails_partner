module typus_framework::authority {
    use sui::linked_table::LinkedTable;

    struct Authority has store {
        whitelist: LinkedTable<address, bool>,
    }
}