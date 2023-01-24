//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.7;
contract IMBUE_GymProfileSetUp
    {
    
    struct GymDetailsStruct
    {
          string  GymImageURLs; 
          string  GymName;
          string  Genre;
          string  Description;
          string  Addresses;
          string  SocialMediaLinks;
          uint    MemberShipPrice;
          uint128 MobileNumber;  

    }
    
    mapping(address=>string) private gym_Name;
    mapping(address=>GymDetailsStruct)  viewDescription;
    
    
    event eSetGymDetails(address _user,string _GymName,string _Genre,string _Discription,string _Addresses,string _SocialMediaLinks,
                         uint _MemberShipPrice,uint128 _MobileNumber);
    event eSetGymAddress(string _GymName,string[] _GymLocations);
    event eSetImageUrl(string _GymName,string[] _ImageUrl);
   
    function SetGymDetails(string memory _GymImageURLs, string memory _GymName,string memory _Genre,string memory  _Description, string memory _Addresses,
                           string memory _SocialMediaLinks,uint _MemberShipPrice,uint128 _MobileNumber) public
    {
          viewDescription[msg.sender]=GymDetailsStruct(_GymImageURLs,_GymName,_Genre,_Description,_Addresses,_SocialMediaLinks,_MemberShipPrice,_MobileNumber);
          gym_Name[msg.sender]=_GymName;
          emit eSetGymDetails(msg.sender,_GymName,_Genre,_Description,_Addresses,_SocialMediaLinks,_MemberShipPrice,_MobileNumber);
    }
   
    function ViewDescription(address _user) public view returns(GymDetailsStruct memory)
    {
          return viewDescription[_user];
    }
   
    }