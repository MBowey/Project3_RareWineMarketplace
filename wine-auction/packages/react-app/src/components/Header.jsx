import React from "react";
import { PageHeader } from "antd";

// displays a page header

export default function Header() {
  return (
    <a href="https://www.vivino.com/CA/en/" target="_blank" rel="noopener noreferrer">
      <PageHeader
        title="Wine Auction"
        subTitle="Buyer pays to mint NFT"
        style={{ cursor: "pointer" }}
      />
    </a>
  );
}
