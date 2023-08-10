// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoffeeTrade {
    struct Payment {
        uint256 amount;
        bool paid;
    }

    address public buyer;
    address public suppliesSupplier;
    address public importer;
    address public roaster;
    address public credit;
    address public coffeeProducer;
    uint256 public price;
    Payment public suppliesSupplierPayment;
    Payment public importerPayment;
    Payment public roasterPayment;
    Payment public creditPayment;
    Payment public coffeeProducerPayment;

    constructor(
        address _buyer,
        address _suppliesSupplier,
        address _importer,
        address _roaster,
        address _credit,
        address _coffeeProducer,
        uint256 _price
    ) {
        buyer = _buyer;
        suppliesSupplier = _suppliesSupplier;
        importer = _importer;
        roaster = _roaster;
        credit = _credit;
        coffeeProducer = _coffeeProducer;
        price = _price;
    }

    function pay() public payable {
        require(msg.sender == buyer, "Only buyer can pay");
        require(msg.value == price, "Price must be paid in full");

        suppliesSupplierPayment.amount = price / 5;
        importerPayment.amount = price / 5;
        roasterPayment.amount = price / 5;
        creditPayment.amount = price / 5;
        coffeeProducerPayment.amount = price / 5;
    }

    function releasePayment() public {
        if (msg.sender == suppliesSupplier) {
            require(suppliesSupplierPayment.amount > 0, "No payment available");
            require(suppliesSupplierPayment.paid == false, "Payment already released");

            suppliesSupplierPayment.paid = true;
            payable(suppliesSupplier).transfer(suppliesSupplierPayment.amount);
        } else if (msg.sender == importer) {
            require(importerPayment.amount > 0, "No payment available");
            require(importerPayment.paid == false, "Payment already released");

            importerPayment.paid = true;
            payable(importer).transfer(importerPayment.amount);
        } else if (msg.sender == roaster) {
            require(roasterPayment.amount > 0, "No payment available");
            require(roasterPayment.paid == false, "Payment already released");

            roasterPayment.paid = true;
            payable(roaster).transfer(roasterPayment.amount);
        } else if (msg.sender == credit) {
            require(creditPayment.amount > 0, "No payment available");
            require(creditPayment.paid == false, "Payment already released");

            creditPayment.paid = true;
            payable(credit).transfer(creditPayment.amount);
        } else if (msg.sender == coffeeProducer) {
            require(coffeeProducerPayment.amount > 0, "No payment available");
            require(coffeeProducerPayment.paid == false, "Payment already released");

            coffeeProducerPayment.paid = true;
            payable(coffeeProducer).transfer(coffeeProducerPayment.amount);
        } else {
            revert("Invalid caller");
        }
    }
}
