# Bytus Token

<div align="center">
  
  <br>
  <h3>A secure and flexible ERC20 token implementation</h3>

  ![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
  ![Solidity](https://img.shields.io/badge/Solidity-0.8.20-blue)
  ![OpenZeppelin](https://img.shields.io/badge/OpenZeppelin-4.9.3-blue)
  ![Hardhat](https://img.shields.io/badge/Hardhat-2.22.19-blue)
</div>

## Overview

Bytus Token (BYTS) is a comprehensive ERC20 token implementation built with enhanced security features and a powerful admin dashboard. It provides all standard ERC20 functionality plus additional capabilities like pausing transfers in emergencies and burning tokens.

### Key Features

- 🔒 **Security-focused design** based on OpenZeppelin contracts
- ⏸️ **Pausable transactions** for emergency situations
- 🔥 **Burnable tokens** to reduce supply when needed
- 🖥️ **Web-based admin dashboard** for complete management
- 💰 **Custom 3-decimal precision** instead of standard 18

## Quick Start

### Prerequisites

- Node.js (v14+)
- npm or yarn
- MetaMask wallet extension

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/bytus-token.git
cd bytus-token

# Install dependencies
npm install

# Start local Hardhat node
npx hardhat node

# Deploy contract to local network
npx hardhat run scripts/deploy.js --network localhost
```

### Accessing the Admin Dashboard

```bash
# Start a local web server (choose one)
npx http-server -p 8080
# OR
python -m http.server 8080
```

Then open [http://localhost:8080](http://localhost:8080) in your browser.

## Project Structure

```
bytus-token/
├── contracts/               # Smart contracts
│   └── BytusToken.sol       # Main token contract
├── scripts/                 # Deployment scripts
│   └── deploy.js            # Token deployment script
├── test/                    # Test directory
├── artifacts/               # Compiled contract artifacts (generated)
├── cache/                   # Hardhat cache (generated)
├── hardhat.config.js        # Hardhat configuration
├── index.html               # Admin dashboard
└── package.json             # Project configuration
```

## Smart Contract Details

The BytusToken contract inherits from several OpenZeppelin contracts for maximum security:

- **ERC20**: Base token functionality
- **ERC20Burnable**: Token burning capabilities
- **Pausable**: Emergency pause mechanism
- **Ownable**: Access control for admin functions

```solidity
contract BytusToken is ERC20, ERC20Burnable, Pausable, Ownable {
    // Contract implementation
}
```

### Custom Features

- **3 decimal places** instead of the standard 18 for simplified calculations
- **approveAndCall** function for single-transaction approvals and contract interactions
- **Pausable transfers** for emergency situations

## Admin Dashboard

The included web-based dashboard provides a complete interface for managing your token:


### Dashboard Features

- 🔌 **Connect** with MetaMask
- 💸 **Transfer** tokens to any address
- ✅ **Approve** spending allowances
- 🔥 **Burn** tokens to reduce supply
- ⏸️ **Pause/unpause** all token transfers (admin only)
- 📊 **Monitor** token statistics and transaction history

## MetaMask Configuration

To interact with the token on your local network:

1. **Add Hardhat Network to MetaMask:**
   - Network Name: `Hardhat Local`
   - RPC URL: `http://127.0.0.1:8545`
   - Chain ID: `31337`
   - Currency Symbol: `ETH`

2. **Import a test account:**
   - Copy a private key from the Hardhat console
   - In MetaMask: Account → Import Account → paste private key

## Deployment

### Local Development

```bash
# Start local network
npx hardhat node

# Deploy contract
npx hardhat run scripts/deploy.js --network localhost
```

### Testnet/Mainnet Deployment

1. Configure your `.env` file:
   ```
   PRIVATE_KEY=your_private_key
   INFURA_API_KEY=your_infura_api_key
   ```

2. Update hardhat.config.js with network details

3. Deploy:
   ```bash
   npx hardhat run scripts/deploy.js --network goerli
   ```

## Security

- Built on audited OpenZeppelin contracts
- Implements access control for admin functions
- Includes emergency pause mechanism
- Custom functions follow security best practices

## Development

### Using HTTPS in Development

For a more secure development environment:

```bash
# Install local-ssl-proxy
npm install -g local-ssl-proxy

# Run your normal web server
http-server -p 8080

# In another terminal, start the proxy
local-ssl-proxy --source 8443 --target 8080
```

Then access the dashboard at [https://localhost:8443](https://localhost:8443)

### Testing

```bash
# Run all tests
npx hardhat test

# Run specific test file
npx hardhat test test/token-test.js
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

- Website: [https://bytus.io](https://bytus.io)
- Email: contact@chronocoder.dev

---

<div align="center">
  <p>Built with ❤️ by ChronoCoder</p>
</div>
