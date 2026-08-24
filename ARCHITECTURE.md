# Architecture Document: GASCHAIN 🏛️⛓️

## 1. System Overview
**GASCHAIN** is a decentralized supply chain and logistics protocol designed to eliminate LPG distribution fraud, automate subsidy payouts, and provide end-to-end chain of custody tracking. By leveraging the **Stellar Network** and **Soroban Smart Contracts (Rust)**, GasChain guarantees cryptographic integrity from Depot to Metro Distributors and final consumers.

---

## 2. Core Components

### 2.1 Frontend (React + Vite)
- **Framework**: React 18 for reactive dashboard structures.
- **Build Tool**: Vite for rapid module reloading and lightweight production builds.
- **Styling**: Tailwind CSS with custom glassmorphic components and Framer Motion animation overlays.
- **State Management**: Context-based session management (`WalletContext`) for wallet auth and active connection states.

### 2.2 Smart Contract Architecture (Soroban + Rust)
- **Registry**: Tracks physical cylinders by unique serial number (`register_cylinder`) and metadata.
- **Booking Manager**: Handles domestic and commercial cylinder bookings (`book_cylinder`).
- **Logistics Handoff**: Allows verified distributors to update delivery status (`update_status`).
- **Settle Subsidy**: Handles on-chain subsidy calculations and settlements (`settle_subsidy`).
- **Emergency Circuit Breaker**: Admin-only emergency stop toggle (`toggle_emergency_stop`) to freeze state updates in case of threat detection.

### 2.3 Event Indexing & Cache Layer (Base44)
- **Role**: Real-time blockchain ledger indexer and WebSocket listener.
- **Latency**: Decouples read operations from Horizon RPC, delivering sub-200ms dashboard updates.
- **Verification Loop**: Periodically matches off-chain indexer state with on-chain Stellar transaction sequences.

---

## 3. High-Level Workflows

### 3.1 Gasless Cylinder Booking (Fee Sponsorship)
1. **Selection**: User connects Freighter and chooses a distributor and cylinder.
2. **Tx Building**: The app generates a transaction. The GasChain treasury sponsors the XLM gas fee via a **Fee-Bump Transaction**.
3. **Soroban Call**: The user signs, and the contract executes `book_cylinder`, writing the booking ID and state to the ledger.

### 3.2 Chain of Custody Handover
1. **Event Trigger**: When a cylinder is booked, a Soroban event is emitted.
2. **Distributor Handoff**: The distributor logs into the supply chain view and changes status to `OutForDelivery`.
3. **Handoff Complete**: Upon delivery, status transitions to `Delivered`, transferring digital custody on-chain.

### 3.3 Automated Subsidy Settlement
1. **Verification**: Once status is marked as `Delivered`, the government authority checks eligibility on-chain.
2. **Settle Call**: The authority calls `settle_subsidy` to release funding units to the user profile.

---

## 4. Security & Performance
- **Non-Custodial Security**: Users connect via Freighter. Keys never leave the client's local sandbox.
- **Access Control**: Role-based authentication limits administrative commands to registered administrators/distributors.
- **TTL Extension**: Auto-extends storage instance lifetimes (`extend_ttl`) to safeguard contract state in production.

---

## 5. CI/CD & Deployment
- **Verification Pipeline**: Automated testing via GitHub Actions (Rust compiler tests + frontend ESLint builds).
- **Production Server**: Deployed and scaled on Vercel.

---

MIT © 2026 GASCHAIN — ashu19846b-tech
