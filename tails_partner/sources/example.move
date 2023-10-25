module tails_partner::example {
    use sui::object::{Self, UID};
    use sui::dynamic_field;
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    use typus_dov::typus_dov_single::{Registry as TypusRegistry};
    use typus_dov::tails_staking::{PartnerKey, partner_add_exp};

    // Any shared object to store the PartnerKey
    struct Registry has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let registry = Registry { id: object::new(ctx) };
        transfer::share_object(registry);
    }

    // Store the PartnerKey in the shared object
    entry fun add_tails_partner_key(
        registry: &mut Registry,
        tails_partner_key: PartnerKey,
    ) {
        dynamic_field::add(&mut registry.id, b"tails_partner_key", tails_partner_key);
    }

    entry fun example_1(
        registry: &mut Registry,
        typus_registry: &mut TypusRegistry,
        ctx: &mut TxContext
    ) {
        // assume the `owner` (ctx sender) do something rewardable...
        // assume that `owner` is trading 100 USD and earning 100 exp
        let owner = tx_context::sender(ctx);
        let exp = 100;

        let tails_partner_key = dynamic_field::borrow(&registry.id, b"tails_partner_key");

        partner_add_exp(
            typus_registry,
            tails_partner_key,
            owner,
            exp,
        )
    }

}