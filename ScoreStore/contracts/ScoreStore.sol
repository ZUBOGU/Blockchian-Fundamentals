pragma solidity ^0.4.17;
contract ScoreStore {
    mapping(string => int) PersonScores;

    function AddPersonScore(string name, int startingScore) public {
        // check if a name add twice.
        if (PersonScores[name] > 0 ) {
            revert();
        } else {
            PersonScores[name] = startingScore;
        }
    }

    function GetScore(string name) public view returns (int) {
        return PersonScores[name];
    }
}