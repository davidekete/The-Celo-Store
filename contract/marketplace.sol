// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IERC20Token {
  function transfer(address, uint256) external returns (bool);
  function approve(address, uint256) external returns (bool);
  function transferFrom(address, address, uint256) external returns (bool);
  function totalSupply() external view returns (uint256);
  function balanceOf(address) external view returns (uint256);
  function allowance(address, address) external view returns (uint256);
 
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Marketplace {

    uint internal productsLength = 0;
    uint internal soldUnits=0;
    address internal cUsdTokenAddress = 0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1;

    struct Product {
        address payable owner;
        string name;
        string image;
        string description;
        string location;
        uint quantity;
        uint price;
    }

    mapping (uint => Product) internal products;

    function writeProduct(
        string memory _name,
        string memory _image,
        string memory _description, 
        string memory _location,
        uint _quantity,
        uint _price
    ) public {
        products[productsLength] = Product(
            payable(msg.sender),
            _name,
            _image,
            _description,
            _location,
            _quantity,
            _price
            
        );
        productsLength++;
    }

    function readProduct(uint _index) public view returns (
        address payable,
        string memory, 
        string memory, 
        string memory, 
        string memory, 
        uint, 
        uint
    ) {
        return (
            products[_index].owner,
            products[_index].name, 
            products[_index].image, 
            products[_index].description, 
            products[_index].location, 
            products[_index].quantity,
            products[_index].price
        );
    }

    function buyProduct(uint _index) public payable  {
        require(
          IERC20Token(cUsdTokenAddress).transferFrom(
            msg.sender,
            products[_index].owner,
            products[_index].price
          ),
          "Purchase failed."
        );
        products[_index].quantity--;
        soldUnits++;
    }
    
    function getProductsLength() public view returns (uint) {
        return (productsLength);
    }

    function getUnitsSold() public view returns(uint){
        return (soldUnits);
    }

    function deleteProduct(uint _index) public{
        delete products[_index];
    }

    function restock(uint _index,uint _quantity) public {
        products[_index].quantity= products[_index].quantity+ _quantity;
    }
}