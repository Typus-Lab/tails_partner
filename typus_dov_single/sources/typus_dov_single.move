module typus_dov::typus_dov_single {
    use std::option::Option;
    use std::string::String;
    use std::type_name::TypeName;
    use sui::object::UID;

    use typus_framework::authority::Authority;
    use typus_framework::balance_pool::BalancePool;

    // ======== Friends ========

    friend typus_dov::tails_staking;

    // ======== Structs =========

    struct TYPUS_DOV_SINGLE has drop {}

    struct Registry has key {
        id: UID,
        num_of_vault: u64,
        authority: Authority,
        fee_pool: BalancePool,
        portfolio_vault_registry: UID, // 1
        deposit_vault_registry: UID, // 1
        auction_registry: UID, // num_of_vault
        bid_vault_registry: UID, // num_of_vault * round
        refund_vault_registry: UID, // n tokens
        additional_config_registry: UID,
        version: u64,
        transaction_suspended: bool,
    }

    struct PortfolioVault has key, store {
        id: UID,
        info: Info,
        config: Config,
        authority: Authority,
    }

    struct Info has copy, drop, store {
        index: u64,
        option_type: u64, // 0: Call, 1: Put, 2: CallSpread, 3: PutSpread, 4: CallButterfly, 5: PutButterfly
        period: u8, // Daily = 0, Weekly = 1, Monthly = 2
        activation_ts_ms: u64,
        expiration_ts_ms: u64,
        deposit_token: TypeName,
        bid_token: TypeName,
        settlement_base: TypeName,
        settlement_quote: TypeName,
        settlement_base_name: String,
        settlement_quote_name: String,
        d_token_decimal: u64,
        b_token_decimal: u64,
        o_token_decimal: u64,
        creator: address,
        create_ts_ms: u64,
        round: u64,
        status: u64,
        oracle_info: OracleInfo,
        delivery_infos: DeliveryInfos, // update after delivery
        settlement_info: Option<SettlementInfo>,
        u64_padding: vector<u64>,
        bcs_padding: vector<u8>,
    }

    struct Config has copy, drop, store {
        oracle_id: address,
        deposit_lot_size: u64,
        bid_lot_size: u64,
        min_deposit_size: u64,
        min_bid_size: u64,
        max_deposit_entry: u64,
        max_bid_entry: u64,
        deposit_fee_bp: u64,
        deposit_fee_share_bp: u64,
        deposit_shared_fee_pool: Option<vector<u8>>,
        bid_fee_bp: u64,
        deposit_incentive_bp: u64,
        bid_incentive_bp: u64,
        auction_delay_ts_ms: u64,
        auction_duration_ts_ms: u64,
        recoup_delay_ts_ms: u64,
        capacity: u64,
        leverage: u64,
        risk_level: u64,
        has_next: bool, // set next round deposit vault has_next
        active_vault_config: VaultConfig,
        warmup_vault_config: VaultConfig,
        u64_padding: vector<u64>,
        bcs_padding: vector<u8>,
    }

    struct PayoffConfig has copy, drop, store {
        strike_bp: u64,
        weight: u64,
        is_buyer: bool,
        strike: Option<u64>,
        u64_padding: vector<u64>,
    }

    struct VaultConfig has copy, drop, store {
        payoff_configs: vector<PayoffConfig>,
        strike_increment: u64,
        decay_speed: u64,
        initial_price: u64,
        final_price: u64,
        u64_padding: vector<u64>,
    }

    struct OracleInfo has copy, drop, store {
        price: u64,
        decimal: u64,
    }

    struct DeliveryInfos has copy, drop, store {
        round: u64,
        max_size: u64,
        total_delivery_size: u64,
        total_bidder_bid_value: u64,
        total_bidder_fee: u64,
        total_incentive_bid_value: u64,
        total_incentive_fee: u64,
        delivery_info: vector<DeliveryInfo>,
        u64_padding: vector<u64>,
    }

    struct DeliveryInfo has copy, drop, store {
        auction_type: u64, // 0: dutch, 1: otc
        delivery_price: u64,
        delivery_size: u64,
        bidder_bid_value: u64,
        bidder_fee: u64,
        incentive_bid_value: u64,
        incentive_fee: u64,
        ts_ms: u64,
        u64_padding: vector<u64>,
    }

    struct SettlementInfo has copy, drop, store {
        round: u64,
        oracle_price: u64,
        oracle_price_decimal: u64,
        settle_balance: u64,
        settled_balance: u64,
        share_price: u64,
        share_price_decimal: u64,
        ts_ms: u64,
        u64_padding: vector<u64>,
    }
}