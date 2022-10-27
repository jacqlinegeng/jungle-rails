describe('add to cart testing', () => {
  it('Visits home page', () => {
    cy.visit('/')
  })

  it('press add to cart, updates cart nav value', () => {
    cy.get(':nth-child(1) > div > .button_to > .btn').click({ force: true })
    cy.get('.end-0 > .nav-link').contains('My Cart (1)')

    
    
  })

})