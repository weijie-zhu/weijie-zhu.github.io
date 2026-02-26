const { test, expect } = require('playwright/test');

test.use({ browserName: 'webkit', viewport: { width: 1200, height: 800 } });

test('gallery column hover should not shift columns', async ({ page }) => {
  await page.goto('http://127.0.0.1:1313/gallery/', { waitUntil: 'networkidle' });

  const measure = async () => {
    return await page.evaluate(() => {
      const items = [...document.querySelectorAll('.gallery-item')];
      const byCol = {};
      items.forEach((el, i) => {
        const r = el.getBoundingClientRect();
        const left = Math.round(r.left);
        (byCol[left] ||= []).push({ i, top: r.top, h: r.height });
      });
      return Object.keys(byCol)
        .map(Number)
        .sort((a, b) => a - b)
        .map((left) => {
          const arr = byCol[left].sort((a, b) => a.top - b.top);
          return {
            left,
            first: { i: arr[0].i, top: arr[0].top },
            second: { i: arr[1].i, top: arr[1].top },
          };
        });
    });
  };

  const target = page.locator('.gallery-item').nth(37);

  const before = await measure();
  await page.screenshot({ path: 'output/playwright/webkit-before-hover.png' });

  await target.hover();
  await page.waitForTimeout(250);

  const after = await measure();
  await page.screenshot({ path: 'output/playwright/webkit-after-hover.png' });

  const delta = after.map((c, i) => ({
    left: c.left,
    firstTopDelta: Number((c.first.top - before[i].first.top).toFixed(4)),
    secondTopDelta: Number((c.second.top - before[i].second.top).toFixed(4)),
  }));

  console.log('WEBKIT_DELTA=' + JSON.stringify(delta));

  for (const d of delta) {
    expect(Math.abs(d.firstTopDelta)).toBeLessThanOrEqual(0.5);
    expect(Math.abs(d.secondTopDelta)).toBeLessThanOrEqual(0.5);
  }
});
