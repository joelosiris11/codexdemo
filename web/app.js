const form = document.getElementById('purchase-form');
const list = document.getElementById('purchase-list');
const STORAGE_KEY = 'purchases';

function loadPurchases() {
    const stored = localStorage.getItem(STORAGE_KEY);
    return stored ? JSON.parse(stored) : [];
}

function savePurchases(purchases) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(purchases));
}

function addRow(purchase) {
    const tr = document.createElement('tr');
    tr.innerHTML = `
        <td>${purchase.item}</td>
        <td>${purchase.price.toFixed(2)}</td>
        <td>${purchase.date}</td>`;
    list.appendChild(tr);
}

function render() {
    list.innerHTML = '';
    const purchases = loadPurchases();
    purchases.forEach(addRow);
}

form.addEventListener('submit', e => {
    e.preventDefault();
    const purchase = {
        item: document.getElementById('item').value,
        price: parseFloat(document.getElementById('price').value),
        date: document.getElementById('date').value
    };
    const purchases = loadPurchases();
    purchases.push(purchase);
    savePurchases(purchases);
    addRow(purchase);
    form.reset();
});

render();
