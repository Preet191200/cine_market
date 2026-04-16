describe('Shopping Cart', () => {
  beforeEach(() => {
    cy.visit('/users/sign_in')
    cy.get('input[name="user[email]"]').type('test@example.com')
    cy.get('input[name="user[password]"]').type('password123')
    cy.get('input[type="submit"]').click()
  })

  it('adds a product to cart', () => {
    cy.visit('/products')
    cy.get('.product-card').first().click()
    cy.get('input[value="🛒 Add to Cart"]').click()
    cy.url().should('include', '/cart')
    cy.contains('Item added to cart')
  })

  it('shows empty cart message when cart is empty', () => {
    cy.visit('/cart')
    cy.contains('Your cart is empty')
  })

  it('can remove item from cart', () => {
    cy.visit('/products')
    cy.get('.product-card').first().click()
    cy.get('input[value="🛒 Add to Cart"]').click()
    cy.contains('✕ Remove').click()
    cy.contains('Item removed from cart')
  })
})