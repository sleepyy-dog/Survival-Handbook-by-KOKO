# 策略：Aave 闪电贷 + Curve 3pool 套利

## 1. 目标

本策略旨在通过利用 Curve 3pool 中 DAI 和 USDC 之间潜在的价格差异，执行一次原子性的套利交易。它使用 Aave V2 的闪电贷来借入初始资本（DAI）。

## 2. 执行流程

整个操作序列被捆绑在由 `UniversalInterpreter` 合约执行的单笔交易中。

1.  **从 Aave 借款**：从 Aave V2 借贷池发起一笔 100,000 DAI 的闪电贷。
2.  **在 Curve 上套利**：在闪电贷的回调函数 (`executeOperation`) 内部，在 Curve 3pool (`3Crv`) 上执行以下兑换：
    a. 将借来的 100,000 DAI 兑换成 USDC。
    b. 将兑换所得的 USDC 再兑换回 DAI。
3.  **偿还 Aave**：将闪电贷的本金（100,000 DAI）加上费用（0.09%）偿还给 Aave V2 借贷池。
4.  **利润**：如果在系列兑换后最终获得的 DAI 总量大于偿还贷款所需的金额，剩余的余额即为套利利润，将保留在 `UniversalInterpreter` 合约中。

## 3. 如何验证

在分叉的主网环境中运行此策略后，您可以使用 `scripts/check-balance.js` 脚本来验证其是否成功。

-   **验证目标**：脚本应检查已部署的 `UniversalInterpreter` 合约的 DAI 余额。
-   **预期结果**：合约的 DAI 余额应为正数，代表本次交易产生的利润。合约的初始余额为零。
