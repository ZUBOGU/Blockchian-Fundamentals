pragma solidity ^0.4.17;
contract IScoreStore{
    function GetScore(string name) returns (int);
}

contract MyGame{
    function ShowScore(string name) returns (int)
    {   
        //find the address from StoreStore.deployed().
        IScoreStore scoreStore = IScoreStore(0xe6b23e3ff5f6e55c5f6a4526bbbee6326f89bb4f);
        return scoreStore.GetScore(name);
    }
}