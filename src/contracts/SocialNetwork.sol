pragma solidity >=0.4.22 <0.7.0;

contract SocialNetwork {
    
     string public name;
      mapping(uint => Post) public Posts;
      uint postCount = 0;
      struct Post {
          uint id;
          string postContent;
          address authour;
          uint tipAmount;
          
      }
    
    event postCreated(  uint id,
          string postContent,
          address authour,
          uint tipAmount);
    
     constructor() public{
     }
     
     function createPost(string memory  _postContent) public {
         postCount++;
         Posts[postCount] = Post(postCount,_postContent,msg.sender,0);
         emit postCreated(postCount,_postContent,msg.sender,0);
     }
}