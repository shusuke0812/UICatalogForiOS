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
        runValidate()
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
            debugPrint("then")
            self?.configResultLabel("then")
        }.catch { [weak self] error in
            debugPrint("catch: \(error)")
            self?.configResultLabel("catch: \(error)")
        }
    }
}
