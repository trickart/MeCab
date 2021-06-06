# MeCab for Swift

形態素解析エンジン[MeCab](https://taku910.github.io/mecab/)をSwift向けにラップしたライブラリです。

## Usage
MeCabを使用するには辞書が必要です。このライブラリには辞書は含まれておりません。  
辞書は別に用意する必要があります。  

### Installation
#### Swift Packageの[MeCabIPAdic](https://github.com/trickart/MeCabIPAdic)を使用する場合
`Package.swift` のdependenciesにMeCabIPAdicを追加してください。  
(MeCabIPAdicの依存パッケージとしてインストールされます)  
``` swift:Package.swift
dependencies: [
    .package(url: "https://github.com/trickart/MeCabIPAdic.git", .upToNextMinor(from: "270.20070801.0"))
]
```

#### 自前で辞書を用意する場合(Homebrew等でインストールする場合)
`Package.swift` のdependenciesにMeCabを追加してください。
``` swift:Package.swift
dependencies: [
    .package(url: "https://github.com/trickart/MeCab.git", .upToNextMinor(from: "0.0.1"))
]
```

### Example
``` swift:example.swift
import Foundation
import MeCab
// MeCabIPAdicをインストールした場合
import MeCabIPAdic

// MeCabIPAdicをインストールした場合
let tagger = Tagger(url: MeCabIPAdic.url)

// MeCabを直接インストールした場合(Homebrewでインストールした場合)
// let tagger = Tagger(url: URL(string: "/usr/local/lib/mecab/dic/ipadic")!)

print(tagger.parseNode("すもももももももものうち").compactMap((\.surface)))
// -> ["すもも", "も", "もも", "も", "もも", "の", "うち"]
```

## License
This wrapper library is released under The 3-Clause BSD License.  
このラッパーライブラリは三条項BSDライセンスのもとで公開されています。  
