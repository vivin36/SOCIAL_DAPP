const SocialNetwork = artifacts.require("./SocialNetwork.sol");

require("chai")
  .use(require("chai-as-promised"))
  .should();

contract("SocialNetwork", ([deployer, author, tipper]) => {
  let socialNetwork;

  before(async () => {
    socialNetwork = await SocialNetwork.deployed();
  });

  describe("deployment", async () => {
    it("deploys successfully", async () => {
      const address = await socialNetwork.address;
      assert.notEqual(address, 0x0);
      assert.notEqual(address, "");
      assert.notEqual(address, null);
      assert.notEqual(address, undefined);
    });
  });
  describe("Post", async () => {
    let result, postCount;

    before(async () => {
      result = await socialNetwork.createPost("This is my first post", {
        from: author
      });
      postCount = await socialNetwork.postCount();
    });

    it("Create a post", async () => {
      assert.equal(postCount, 1);
      const event = result.logs[0].args;
      assert.equal(event.authour, author, "author is correct");
      assert.equal(event.id.toNumber(), postCount.toNumber(), "id is correct");
      assert.equal(
        event.postContent,
        "This is my first post",
        "author is correct"
      );
    });
  });
});
