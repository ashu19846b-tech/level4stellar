#!/usr/bin/env bash
# Deploy the GasChain Soroban contract to Stellar testnet
# Prerequisites: soroban-cli installed and configured with a testnet account

set -e

# Build the contract (WASM)
cargo build --target wasm32-unknown-unknown --release

WASM_BIN="target/wasm32-unknown-unknown/release/contract.wasm"

# Upload the contract to Soroban testnet and capture the contract ID
CONTRACT_ID=$(soroban contract upload --wasm $WASM_BIN --network testnet --output json | jq -r '.id')

# Optionally initialize the contract if your contract has an init entry point
# soroban contract invoke --id $CONTRACT_ID --fn initialize --network testnet

echo "Contract deployed!"
echo "Contract ID (address): $CONTRACT_ID"

echo $CONTRACT_ID > .contract_address.txt
