 # ⛸️ Skating Race - Onchain Ice Racing Game             
              
Skating Race is a fully onchain multiplayer ice skating game built with Solidity.          
No tokens. No bets. No rewards. Just pure fun and fair racing on the blockchain.         
          
---          
          
## 🚀 Overview       
        
- ❄️ Race on an onchain frozen track        
- 🧊 Up to any number of players per race        
- 🛷 Each player skates step by step until finish line    
- ⚡ First one to reach the end wins       
        
---    
     
## 🛠️ How It Works   
  
1. **Owner** creates a new race.     
2. **Players** join before the race starts.   
3. **Owner** starts the race.      
4. **Players** call `skate()` to move forward one step per transaction.     
5. The first to reach the finish line is recorded as the winner.  
   
No central control — everything is verifiable and fair onchain.   
 
--- 
 
## 🔧 Deployment  
 
You can deploy the contract using [Remix](https://remix.ethereum.org/) or via scripts using Hardhat or Foundry. 

### 🧪 Example with Remix

1. Open [Remix IDE](https://remix.ethereum.org/)
2. Paste the contents of `SkatingRace.sol`
3. Compile using Solidity `^0.8.0`
4. Deploy contract
5. Use contract functions to create races and play

---

## 🧩 Core Contract

See [`SkatingRace.sol`](./SkatingRace.sol)

Main functions:

| Function | Description |
|----------|-------------|
| `createRace()` | Owner creates a new race |
| `joinRace(raceId)` | Players join before race starts |
| `startRace(raceId)` | Owner starts the race |
| `skate(raceId)` | Player moves forward by one step |
| `getWinner(raceId)` | Returns winner of the race |
| `getPlayerPosition(raceId, player)` | Returns current position of player |

---

## 👀 Example Gameplay

```solidity
// Owner creates a race
createRace();

// Players join
joinRace(0); // from different accounts

// Start the race
startRace(0);

// Players race!
skate(0);
skate(0);
// ... until someone wins

// Get winner
getWinner(0);
