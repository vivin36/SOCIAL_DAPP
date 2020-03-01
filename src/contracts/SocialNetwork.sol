pragma solidity >=0.4.22 <0.7.0;

contract SocialNetwork {
    string public name;
    mapping(uint256 => Post) public Posts;
    uint256 public postCount = 0;
    struct Post {
        uint256 id;
        string postContent;
        address authour;
        uint256 tipAmount;
    }

    event postCreated(
        uint256 id,
        string postContent,
        address authour,
        uint256 tipAmount
    );

    constructor() public {}

    function createPost(string memory _postContent) public {
        postCount++;
        Posts[postCount] = Post(postCount, _postContent, msg.sender, 0);
        emit postCreated(postCount, _postContent, msg.sender, 0);
    }
}
