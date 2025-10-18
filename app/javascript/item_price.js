// この関数は、ページの読み込みが完了したとき、またはTurbo Driveによるページ遷移が完了したときに実行されます。
const calculatePrice = () => {
  // id="item-price"の要素を取得
  const priceInput = document.getElementById("item-price");

  // priceInputが存在しない場合は、ここで処理を終了します。
  if (!priceInput) { return; }

  // 価格が入力されるたびにイベントが発火します
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    // 販売手数料（10%）を計算
    const fee = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = fee.toLocaleString(); // 3桁区切りで表示

    // 販売利益を計算
    const profit = inputValue - fee;
    profitDom.innerHTML = profit.toLocaleString(); // 3桁区切りで表示
  });
};

// ページの読み込みとTurbo Driveの遷移の両方で関数を実行するために、イベントリスナーを追加します。
window.addEventListener("turbo:load", calculatePrice);
window.addEventListener("turbo:render", calculatePrice);
