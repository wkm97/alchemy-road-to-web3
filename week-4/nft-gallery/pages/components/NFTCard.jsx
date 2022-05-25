
/**
 * Represents a NFT.
 * @constructor
 * @param {object} nft - The nft to display.
 *                 @param {string} media[0].gateway - The image of the nft.
 *                 @param {string} title - The title of the nft.
 *                 @param {string} id.tokenId - The id of the nft in the contract.
 *                 @param {string} contract.address - The nft belong to this contract.
 *                 @param {string} description - The description of the nft.
 */

const NewNFTCard = ({ nft }) => {

    return (
        <div className="max-w-sm bg-white rounded-lg border border-gray-200 shadow-md">
            <a href="#">
                <img className="rounded-t-lg" src={nft.media[0].gateway} alt={nft.description || "no-description"} />
            </a>
            <div className="p-5">
                <a href="#">
                    <h5 className="mb-2 text-2xl font-bold tracking-tight text-gray-900">{nft.title}</h5>
                </a>
                <p className="mt-1 text-sm text-gray-400">ID: {nft.id.tokenId.substr(nft.id.tokenId.length - 4)}</p>
                <span className="mb-1 text-sm text-gray-400 inline-flex items-center cursor-pointer" onClick={() => navigator.clipboard.writeText(nft.contract.address)}>
                    {`${nft.contract.address.substr(0, 6)}...${nft.contract.address.substr(nft.contract.address.length - 6)}`}
                    <svg xmlns="http://www.w3.org/2000/svg" className="ml-2 -mr-1 w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                    </svg>
                </span>
                <p className="border my-1 border-gray-900"></p>
                <p className="mb-3 font-normal text-gray-700">{nft.description?.substr(0, 150)}</p>
                <a href={`https://etherscan.io/token/${nft.contract.address}`} target="_blank" className="inline-flex items-center py-2 px-3 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                    View on etherscan
                    <svg className="ml-2 -mr-1 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </a>
            </div>
        </div>
    )
}

export { NewNFTCard as NFTCard };