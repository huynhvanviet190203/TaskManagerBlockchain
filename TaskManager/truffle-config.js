const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config();  // Nếu bạn sử dụng biến môi trường từ file .env

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",     // Địa chỉ cục bộ (localhost)
      port: 7545,            // Cổng mặc định của Ganache
      network_id: "*",       // Kết nối với bất kỳ network id nào
      gas: 5500000,          // Giới hạn gas cho các giao dịch
      gasPrice: 20000000000  // Giá gas (20 Gwei)
    }
  },
  compilers: {
    solc: {
      version: "0.8.0"       // Chọn phiên bản Solidity tương ứng
    }
  }
};
