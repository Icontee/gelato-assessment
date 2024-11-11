const { ethers } = require("ethers");

// Initialize provider and signer (e.g., using MetaMask)
const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();

// Contract addresses
const trustedForwarderAddress = "YOUR_TRUSTED_FORWARDER_ADDRESS";
const recipientAddress = "YOUR_RECIPIENT_CONTRACT_ADDRESS";

// ABI for the recipient contract
const recipientABI = [
  "function increment() external",
  "function getCounter() external view returns (uint256)"
];

async function incrementCounter() {
  const recipientContract = new ethers.Contract(recipientAddress, recipientABI, signer);

  // Call the increment function through the trusted forwarder
  const tx = await recipientContract.increment();
  await tx.wait(); // Wait for transaction confirmation

  console.log("Counter incremented!");
}

async function getCounterValue() {
  const recipientContract = new ethers.Contract(recipientAddress, recipientABI, provider);
  
  const counterValue = await recipientContract.getCounter();
  console.log("Current Counter Value:", counterValue.toString());
}
