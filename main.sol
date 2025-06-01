// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SkatingRace {
    uint256 public trackLength = 10;
    address public owner;
    uint256 public raceId;

    struct Player {
        address addr;
        uint256 position;
        bool finished;
    }

    struct Race {
        bool started;
        bool finished;
        address[] players;
        mapping(address => Player) playerData;
        address winner;
    }

    mapping(uint256 => Race) public races;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier raceExists(uint256 _raceId) {
        require(_raceId < raceId, "Race doesn't exist");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function createRace() external onlyOwner {
        Race storage r = races[raceId];
        r.started = false;
        r.finished = false;
        raceId++;
    }

    function joinRace(uint256 _raceId) external raceExists(_raceId) {
        Race storage r = races[_raceId];
        require(!r.started, "Race already started");
        require(r.playerData[msg.sender].addr == address(0), "Already joined");

        r.players.push(msg.sender);
        r.playerData[msg.sender] = Player(msg.sender, 0, false);
    }

    function startRace(uint256 _raceId) external onlyOwner raceExists(_raceId) {
        Race storage r = races[_raceId];
        require(!r.started, "Race already started");
        require(r.players.length > 1, "Not enough players");

        r.started = true;
    }

    function skate(uint256 _raceId) external raceExists(_raceId) {
        Race storage r = races[_raceId];
        require(r.started && !r.finished, "Race not active");
        Player storage p = r.playerData[msg.sender];
        require(!p.finished, "Already finished");

        p.position += 1;

        if (p.position >= trackLength) {
            p.finished = true;
            r.finished = true;
            r.winner = msg.sender;
        }
    }

    function getPlayerPosition(uint256 _raceId, address player) external view returns (uint256) {
        return races[_raceId].playerData[player].position;
    }

    function getPlayers(uint256 _raceId) external view returns (address[] memory) {
        return races[_raceId].players;
    }

    function getWinner(uint256 _raceId) external view returns (address) {
        return races[_raceId].winner;
    }
}
