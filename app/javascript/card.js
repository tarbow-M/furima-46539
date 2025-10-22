const pay = () => {
  // gonで設定した公開鍵を取得
  const publicKey = gon.public_key
  // Pay.jpの初期化
  const payjp = Payjp(publicKey) // PAY.JPテスト公開鍵
  // const payjp = Payjp('pk_test_98387c6e318d1926e2bad1e0') // PAY.JPテスト公開鍵

  // elementsインスタンスを生成
  const elements = payjp.elements();
  // 入力フォームごとにelementインスタンスを生成
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  // 各フォームをHTML上の要素にマウント
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    // Pay.jpにトークン作成をリクエスト
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        // フォームにトークン情報を隠して追加
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // カード情報の各elementをクリア
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);