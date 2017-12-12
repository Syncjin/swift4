//
//  Data.swift
//  portfolio
//
//  Created by 이우진 on 2017. 12. 3..
//  Copyright © 2017년 Sync. All rights reserved.
//

import Foundation

let NSDefault = UserDefaults.standard

class Item: NSObject {  //NSObject = 모든 타입의 데이터
    //MARK: - Value
    var ItemImageName = String()
    var ItemTitleLabel = String()
    
    var Director = String()
    var Genre = String()
    var Actor = [String]()
    var PlayDate = String()
    
    var ContentImageData = NSArray()
    var ContentTextData = NSArray()
}

class ItemGroup: NSObject {
    var ItemGroupTitleLabel = String()
    var ItemSet = [Item]()
    
    func AddItem() -> [ItemGroup] {
        //NewItemGroup
        let NewItemGroup = ItemGroup()
        NewItemGroup.ItemGroupTitleLabel = "현재 상영 영화"
        
        var NewItemSet = [Item]()
        
        let FirstNewItem = Item()
        FirstNewItem.ItemImageName = "저스티스 리그.jpeg"
        FirstNewItem.ItemTitleLabel = "저스티스 리그"
        FirstNewItem.Director = "잭 스나이더"
        FirstNewItem.Genre = "액션, 모험, 판타지"
        FirstNewItem.Actor = ["벤 애플렉","갤 가돗","제이슨 모모아","레이 피셔","에즈라 밀러"]
        FirstNewItem.PlayDate = "PlayDate : 2017. 8. 22"
        FirstNewItem.ContentImageData = ["lol_1_skin1.jpeg","lol_1_skin2.jpeg","lol_1_skin3.jpeg"]
        FirstNewItem.ContentTextData = ["하이 눈 야스오", "불의 축제 야스오", "어둠의 인도자 야스오"]
        NewItemSet.append(FirstNewItem)
        
        let SecondNewItem = Item()
        SecondNewItem.ItemImageName = "러빙 빈센트.jpg"
        SecondNewItem.ItemTitleLabel = "러빙 빈센트"
        SecondNewItem.Director = "도로타 코비엘라 & 휴 웰치맨"
        SecondNewItem.Genre = "애니메이션, 미스터리"
        SecondNewItem.Actor = ["시얼샤 로넌","제롬 플린","에이단 터너","더글러스 부스","헬렌 맥크로리"]
        SecondNewItem.PlayDate = "PlayDate : 2017. 8. 23"
        SecondNewItem.ContentImageData = ["lol_2_skin1.jepg","lol_2_skin2.jpeg"]
        SecondNewItem.ContentTextData = ["오소리 티모", "우주비행사 티모"]
        NewItemSet.append(SecondNewItem)
        
        let ThirdNewItem = Item()
        ThirdNewItem.ItemImageName = "꾼.jpeg"
        ThirdNewItem.ItemTitleLabel = "꾼"
        ThirdNewItem.Director = "장창원"
        ThirdNewItem.Genre = "범죄"
        ThirdNewItem.Actor = ["현빈","유지태","배성우","박성웅","나나"]
        ThirdNewItem.PlayDate = "PlayDate : 2017. 8. 22"
        NewItemSet.append(ThirdNewItem)
        
        let FourthNewItem = Item()
        FourthNewItem.ItemImageName = "해피 데스데이.jpeg"
        FourthNewItem.ItemTitleLabel = "해피 데스데이"
        FourthNewItem.Director = "크리스토퍼 랜던"
        FourthNewItem.Genre = "공포, 미스터리, 스릴러"
        FourthNewItem.Actor = ["제시카 로테","이스라엘 브로우사드","레이첼 매튜스","루비 모딘","찰스 에이트켄"]
        FourthNewItem.PlayDate = "PlayDate : 2017. 8. 22"
        NewItemSet.append(FourthNewItem)
        
        NewItemGroup.ItemSet = NewItemSet
        
        //PreMovieItemGroup
        let PreMovieItemGroup = ItemGroup()
        PreMovieItemGroup.ItemGroupTitleLabel = "개봉 예정 영화❤️"
        
        var PreMovieItemSet = [Item]()
        
        let FirstPreItem = Item()
        FirstPreItem.ItemImageName = "강철비.jpg"
        FirstPreItem.ItemTitleLabel = "강철비"
        FirstPreItem.Director = "양우석"
        FirstPreItem.Genre = "액션, 드라마"
        FirstPreItem.Actor = ["정우성","곽도원","김갑수","김의성","이경영"]
        FirstPreItem.PlayDate = "PlayDate : 2017. 7. 20"
        FirstPreItem.ContentImageData = ["lol_4_skin1.jpeg","lol_4_skin2.jpeg"]
        FirstPreItem.ContentTextData = ["고스족 애니", "티버 애니"]
        PreMovieItemSet.append(FirstPreItem)
        
        let SecondPreItem = Item()
        SecondPreItem.ItemImageName = "반드시 잡는다.jpeg"
        SecondPreItem.ItemTitleLabel = "반드시 잡는다"
        SecondPreItem.Director = "김흥선"
        SecondPreItem.Genre = "스릴러"
        SecondPreItem.Actor = ["백윤식","성동일","천호진","배종옥","손종학"]
        SecondPreItem.PlayDate = "PlayDate : 2017. 7. 22"
        PreMovieItemSet.append(SecondPreItem)
        
        let ThirdPreItem = Item()
        ThirdPreItem.ItemImageName = "오리엔트 특급살인.jpg"
        ThirdPreItem.ItemTitleLabel = "오리엔트 특급살인"
        ThirdPreItem.Director = "케네스 브래너"
        ThirdPreItem.Genre = "드라마, 미스터리, 범죄"
        ThirdPreItem.Actor = ["케네스 브래너","페넬로페 크루즈","윌렘 대포","주디 덴치","조니 뎁"]
        ThirdPreItem.PlayDate = "PlayDate : 2017. 7. 23"
        PreMovieItemSet.append(ThirdPreItem)
        
        let FourthPreItem = Item()
        FourthPreItem.ItemImageName = "스타워즈 라스트 제다이.jpeg"
        FourthPreItem.ItemTitleLabel = "스타워즈 라스트 제다이"
        FourthPreItem.Director = "라이언 존슨"
        FourthPreItem.Genre = "액션, 모험, 판타지"
        FourthPreItem.Actor = ["마크 해밀","데이지 리들리","캐리 피셔","오스카 아이삭","아담 드라이버"]
        FourthPreItem.PlayDate = "PlayDate : 2017. 7. 23"
        PreMovieItemSet.append(FourthPreItem)
        
        let FifthPreItem = Item()
        FifthPreItem.ItemImageName = "어쌔신 더 비기닝.jpg"
        FifthPreItem.ItemTitleLabel = "어쌔신 더 비기닝"
        FifthPreItem.Director = "마이클 쿠에스타"
        FifthPreItem.Genre = "액션, 스릴러"
        FifthPreItem.Actor = ["딜런 오브라이언","마이클 키튼","산나 라단","테일러 키취","시바 네가르"]
        FifthPreItem.PlayDate = "PlayDate : 2017. 7. 24"
        PreMovieItemSet.append(FifthPreItem)
        
        PreMovieItemGroup.ItemSet = PreMovieItemSet
        
        //ReplayItemGroup
        let ReplayItemGroup = ItemGroup()
        ReplayItemGroup.ItemGroupTitleLabel = "다시 상영 영화"
        var ReplayItemSet = [Item]()
        
        let FirstReplayItem = Item()
        FirstReplayItem.ItemImageName = "라라랜드.jpeg"
        FirstReplayItem.ItemTitleLabel = "라라랜드"
        FirstReplayItem.Director = "데이미언 셔젤"
        FirstReplayItem.Genre = "드라마, 뮤지컬, 로맨스"
        FirstReplayItem.Actor = ["라이언 고슬링","엠마 스톤","존 레전드","로즈마리 드윗","J.K. 시몬스"]
        FirstReplayItem.PlayDate = "PlayDate : 2017. 8. 25"
        ReplayItemSet.append(FirstReplayItem)
        
        let SecondReplayItem = Item()
        SecondReplayItem.ItemImageName = "러브레터.jpeg"
        SecondReplayItem.ItemTitleLabel = "러브레터"
        SecondReplayItem.Director = "이와이 슌지"
        SecondReplayItem.Genre = "드라마, 로맨스"
        SecondReplayItem.Actor = ["나카야마 미호","토요카와 에츠시","한 분샤쿠","시노하라 카츠유키","사카이 미키"]
        SecondReplayItem.PlayDate = "PlayDate : 2017. 8. 26"
        ReplayItemSet.append(SecondReplayItem)
        
        let ThirdReplayItem = Item()
        ThirdReplayItem.ItemImageName = "러브액츄얼리.jpg"
        ThirdReplayItem.ItemTitleLabel = "러브액츄얼리"
        ThirdReplayItem.Director = "리차드 커티스"
        ThirdReplayItem.Genre = "로맨스, 드라마, 코미디"
        ThirdReplayItem.Actor = ["휴 그랜트","리암 니슨","콜린 퍼스","로라 리니","엠마 톰슨"]
        ThirdReplayItem.PlayDate = "PlayDate : 2017. 8. 27"
        ReplayItemSet.append(ThirdReplayItem)
        
        let FourthReplayItem = Item()
        FourthReplayItem.ItemImageName = "사랑과 영혼.jpg"
        FourthReplayItem.ItemTitleLabel = "사랑과 영혼"
        FourthReplayItem.Director = "제리 주커"
        FourthReplayItem.Genre = "로맨스, 드라마"
        FourthReplayItem.Actor = ["패트릭 스웨이지","데미 무어","우피 골드버그","토니 골드윈"]
        FourthReplayItem.PlayDate = "PlayDate : 2017. 8. 28"
        ReplayItemSet.append(FourthReplayItem)
        
        let FifthReplayItem = Item()
        FifthReplayItem.ItemImageName = "월터의 상상은 현실이 된다.gif"
        FifthReplayItem.ItemTitleLabel = "월터의 상상은 현실이 된다"
        FifthReplayItem.Director = "벤 스틸러"
        FifthReplayItem.Genre = "모험, 드라마, 판타지"
        FifthReplayItem.Actor = ["벤 스틸러","크리스틴 위그","숀 펜","셜리 맥클레인","아담 스콧"]
        FifthReplayItem.PlayDate = "PlayDate : 2017. 8. 28"
        ReplayItemSet.append(FifthReplayItem)
        
        ReplayItemGroup.ItemSet = ReplayItemSet
        
        return [NewItemGroup, PreMovieItemGroup, ReplayItemGroup]
    }
}
