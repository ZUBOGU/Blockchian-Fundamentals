module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    }
    /*
    production: {
      host: "xxxx.xxx.com", //ETHEREUM-RPC-ENDPOINT from azure without http part
      // remove port
      network_id: "*" // Match any network id
    }
    */
  }
};
