//
//  HydraViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2022/10/9.
//  Copyright © 2022 shusuke. All rights reserved.
//

import UIKit
import Hydra

class HydraViewController: UIViewController {
    @IBOutlet private weak var promiseRunButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    // MARK: Action
    @IBAction private func promiseRun(_ sender: UIButton) {
        //runAlways()
        //runValidate()
        //runTimeout()
        //runAll()
        //runAny()
        runPass()
    }
    
    private func initialize() {
        promiseRunButton.setTitle("Promise実行", for: .normal)
        promiseRunButton.backgroundColor = .darkGray
        promiseRunButton.tintColor = .white
        promiseRunButton.layer.cornerRadius = 4
        promiseRunButton.clipsToBounds = true
        
        resultLabel.text = "-"
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 17, weight: .bold)
    }
    private func configResultLabel(_ text: String) {
        DispatchQueue.main.async {
            sleep(1)
            self.resultLabel.text = text
        }
    }
}

extension HydraViewController {
    
    // MARK: - Always

    private func alwaysSample() -> Promise<Void> {
        return Promise<Void>(in: .background, { resolve, reject, _ in
            if Int.random(in: 0..<2) == 0 {
                resolve(())
            } else {
                reject(HydraError.default)
            }
        })
    }
    private func runAlways() {
        alwaysSample().then { [weak self] _ in
            debugPrint("then")
            self?.configResultLabel("then")
        }.catch { [weak self] error in
            debugPrint("catch: \(error)")
            self?.configResultLabel("catch: \(error)")
        }.always { [weak self] in
            // Promiseの結果が resole でも reject でも最後に必ず呼ばれる
            debugPrint("always")
            self?.configResultLabel("always")
        }
    }
    
    // MARK: - Validate

    private func validateSample() -> Promise<Int> {
        return Promise<Int>(in: .background, { resolve, _, _ in
            resolve(Int.random(in: 0..<2))
        })
    }
    private func runValidate() {
        validateSample().validate { result in
            guard result == 1 else {
                return false
            }
            return true
        }.then { [weak self] _ in
            // validate結果が`true`の時に実行
            debugPrint("then")
            self?.configResultLabel("then")
        }.catch { [weak self] error in
            // validate結果が`false`の時に実行
            debugPrint("catch: \(error)")
            self?.configResultLabel("catch: \(error)")
        }
    }
    
    // MARK: - Timeout
    
    private func timeoutSample() -> Promise<Void> {
        return Promise<Void>(in: .background, { resolve, reject, _ in
            resolve(())
        }).defer(2) // resolveに2sかけるために擬似的に設定
    }
    
    private func runTimeout() {
        // 引数`timeout`で設定した値以内でPromiseが返って来ればthenが呼ばれる
        // ✨ 所感：API responseが返ってこない時のハンドリングに使えそう（フォールバック処理etc）
        timeoutSample().timeout(in: .background, timeout: 3, error: HydraError.timeout).then { [weak self] _ in
            debugPrint("then")
            self?.configResultLabel("then")
        }.catch { [weak self] error in
            debugPrint("catch: \(error)")
            self?.configResultLabel("catch: \(error)")
        }
    }
    
    // MARK: - All
    
    private func sample1() -> Promise<Int> {
        return Promise<Int>(in: .background, { resolve, reject, _ in
            let value = Int.random(in: 0..<2)
            if value > 0 {
                resolve(value)
            } else {
                reject(HydraError.error1)
            }
        })
    }

    private func sample2() -> Promise<Int> {
        return Promise<Int>(in: .background, { resolve, reject, _ in
            let value = Int.random(in: 0..<2)
            if value > 0 {
                resolve(value)
            } else {
                reject(HydraError.error2)
            }
        })
    }
    
    private func runAll() {
        // allの引数で設定したPromiseの戻り値が全てresolveの時にthenが呼ばれる. allの引数のPromiseは並列で実行される.
        // ✨ 所感：１つの結果を得るために複数のAPIを呼ぶ必要がある場合のハンドリングに使えそう
        all([sample1(), sample2()]).then { [weak self] results in
            debugPrint("then")
            self?.configResultLabel("then: \(results)")
        }.catch { [weak self] error in
            debugPrint("catch: \(error)")
            self?.configResultLabel("catch: \(error)")
        }
    }
    
    // MARK: - Any
    
    private func runAny() {
        // anyの引数で設定したPromiseの戻り値が一番速いものでthen/catchを処理. anyの引数のPromiseは並列で実行される.
        any(sample1(), sample2()).then { [weak self] result in
            debugPrint("then: \(result)")
            self?.configResultLabel("then: \(result)")
        }.catch { [weak self] error in
            debugPrint("catch: \(error)")
            self?.configResultLabel("catch: \(error)")
        }
    }
    
    // MARK: - Pass
    
    private func passSample() -> Promise<Int> {
        return Promise<Int>(in: .background, { resolve, _, _ in
            resolve(Int.random(in: 0..<51))
        })
    }
    
    private func runPass() {
        // Promiseの戻り値を確認して、結果を次に渡したりrejectしたりできる. validateとの違いは結果を次に渡せるか否か.
        passSample().pass { result -> Promise<Int> in
            return Promise<Int>(in: .background, { resolve, reject, _ in
                if result % 2 == 0 {
                    resolve(result)
                } else {
                    reject(HydraError.pass)
                }
            })
        }.then { [weak self] result in
            debugPrint("then: \(result)")
            self?.configResultLabel("then: \(result)")
        }.catch { [weak self] error in
            debugPrint("error: \(error)")
            self?.configResultLabel("error: \(error)")
        }
    }
}
