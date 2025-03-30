async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const BytusToken = await ethers.getContractFactory("BytusToken");
  const token = await BytusToken.deploy(
    66000000, // 66 million initial supply (before decimals)
    "Bytus Token", // Name
    "BYTS" // Symbol
  );

  await token.waitForDeployment();
  console.log("BytusToken deployed to:", await token.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });