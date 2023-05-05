/*
  NewList class
  - store the title, description, image, and published date time.
  Last updated: 15 Apr 2023
*/
class NewsList {
  final List<String> newsTitle = [
    "Bitcoin Mining Firm Sphere 3D Sues Gryphon Digital "
        "Over Spoofing Attack - Here's What Happened",
    "Shiba Inu Price Prediction as SHIB Overtakes Tron Blockchain"
        " in Market Capitalization - Huge Price Pump Incoming? ",
    "Solana's Latest Tech Solution Aims to Dramatically Reduce"
        " On-Chain Storage Costs - Here's How it Works",
    "Bitcoin and Ethereum Price Predictions: BTC and "
        "ETH Soar Over 6%, What's Next?",
    "Divergent On-chain Trends Within Ethereum/Bitcoin Network"
        " Add to Reasons Why the ETH/BTC Price Might Continue Dropping",
    "Ethereum Core Developers Announce Date for"
        " Long-Awaited Shapella Upgrade - Here's What You Need to Know",
    "Ethereum's Shanghai Hard Fork Target Date Revealed:"
        " Staked ETH Withdrawals Coming Soon",
    "MetaMask Introduces More Payment Options for Buying Cryptocurrencies"
        " - Crypto Adoption on the Rise?",
  ];

  final List<String> newsDescription = [
    "Bitcoin mining firm Sphere 3D is suing Gryphon Digital Mining"
        ", its business partner, for losing about \$500,000 worth of Bitcoin"
        " due to a spoofing attack",
    "Major US macro events this week could trigger significant volatility in crypto,"
        " with Shiba Inu (SHIB) bulls hoping for price upside.",
    "Popular layer-1 blockchain Solana has unveiled a new solution"
        " that will dramatically decrease the cost of storing data on-chain.",
    "Bitcoin, the world's largest digital currency, maintained its upward rally,"
        " rising 7% to \$30,193 for the first time since June."
        " This occurred just before Consumer Price Index (CPI) data was released.",
    "Ether (ETH) could continue to rise in tandem with the broader crypto market,"
        " but it may struggle to match upside in Bitcoin.",
    "It's happening, said an Ethereum (ETH) core developer,"
        " announcing the launch of the network's much-anticipated Shapella"
        " update in two weeks.",
    "The date of the important upcoming Ethereum Shanghai upgrade has been"
        " revealed by lead Ethereum developer Tim Beiko."
        " Read on to learn more.",
    "Popular crypto wallet MetaMask has added a new feature"
        " that enables its users to buy crypto"
        " with fiat directly from its Portfolio Dapp. Here's the latest.",
  ];

  final List<String> newsImage = [
    'assets/images/news_image_01.jpeg',
    'assets/images/news_image_02.jpeg',
    'assets/images/news_image_03.jpeg',
    'assets/images/news_image_04.jpeg',
    'assets/images/news_image_05.jpeg',
    'assets/images/news_image_06.jpeg',
    'assets/images/news_image_07.jpeg',
    'assets/images/news_image_08.jpeg',
  ];

  final List<String> publishedDateTime = [
    '1 hour ago',
    '3 hour ago',
    '3 hour ago',
    '4 hour ago',
    '4 hour ago',
    '6 hour ago',
    '7 hour ago',
    '10 hour ago',
  ];

  // return news title
  String getNewsTitle(int count) {
    return newsTitle[count];
  }
  // return news description
  String getNewsDescription(int count) {
    return newsDescription[count];
  }
  // return news image
  String getNewsImage(int count) {
    return newsImage[count];
  }
  // return news publish date time
  String getPublishedDateTime(int count) {
    return publishedDateTime[count];
  }
}