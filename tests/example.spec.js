// @ts-check
const { test, expect } = require('@playwright/test');

test('must use system certificates', async ({ page }) => {
  await page.goto('https://untrusted-root.badssl.com/');
});