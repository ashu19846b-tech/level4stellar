# GASCHAIN — Decentralized LPG Supply Chain: User Guide 📖

Welcome to **GASCHAIN**, the world's first decentralized LPG booking and logistics monitoring protocol built on Stellar. This guide will help you navigate the platform and manage your supply chain interactions.

---

## 🏁 Getting Started

### 1. Prerequisites
- **Browser**: Chrome, Brave, or Firefox.
- **Wallet**: [Freighter Wallet](https://www.freighter.app/) extension installed.
- **Network**: Switch Freighter to **Testnet** (Settings -> Network -> Testnet).
- **Test XLM**: Get free test tokens from the [Stellar Laboratory Friendbot](https://laboratory.stellar.org/#friendbot).

### 2. Connecting your Wallet
1. Open the [GasChain Web App](https://level6-2mgt.vercel.app/).
2. Click **"Connect Wallet"** on the landing page or navbar.
3. Approve the connection request in your Freighter extension.
4. Once connected, your wallet address and XLM balance will appear in the navigation bar.

---

## 🏛️ Core Features

### 🛢️ Booking a Cylinder
1. Navigate to the **Book Cylinder** page.
2. Select the required cylinder type (e.g., 14.2kg Domestic / 19kg Commercial).
3. Select a verified distributor from the dropdown registry.
4. Submit the booking request. This initiates a Soroban smart contract call to `book_cylinder`.
5. Freighter will request a signature. 
   - *Note: GasChain implements **Fee Sponsorship** (Fee-Bump Transactions). Your cylinder booking transactions are gasless! The GasChain Treasury pays the XLM network fees.*

### 🚚 Logistics & Custody Tracking
1. Go to the **Supply Chain** dashboard.
2. Distributors can update the custody status of pending bookings (Pending, Confirmed, Out for Delivery, Delivered, Cancelled).
3. The cylinder status is dynamically tracked on-chain with automatic ownership updates.

### 💰 Automated Subsidies
1. Eligible domestic users receive automated LPG subsidies calculated on-chain.
2. Once the distributor marks a cylinder as `Delivered`, the government authority settles the subsidy payout via the `settle_subsidy` function.
3. Track your subsidy payout history directly on the **Subsidies** dashboard page.

### 📈 Metrics & Ledger Monitor
1. Visit the **Ledger Monitor** page (`/ledger`) for live system-wide monitoring.
2. View real-time block consensus heights, transaction processing times (TPS), and raw blockchain event logs.
3. Access network analytics under the **Metrics** section.

---

## 🛡️ Security & Privacy
- **Immutable Ledger**: Every custody handoff and subsidy settlement is permanently written to the Stellar Ledger.
- **Non-Custodial**: Freighter secure authentication guarantees that you retain absolute control over your keypair.
- **On-Chain Audit**: Use the provided explorer links under **My Bookings** to view raw transaction receipts on Stellar Expert.

---

## ❓ FAQ
**Q: What is "Fee Sponsorship"?**
**A**: To make onboarding easy, GasChain sponsors the transaction fees for cylinder booking. You do not need XLM to transact.

**Q: Are these real physical cylinders?**
**A**: Currently, GasChain is running on the **Stellar Testnet** for Level 5. All assets are digital proofs of concept.

---

*For support, reach out to the GasChain Developer team on the GitHub repository.*
