/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author joyce
 */
public class itensVenda {
    
    private Produto produto = new Produto();
    private Integer codItensVenda;
    private Integer venda;
    private Integer quantidade;
    private Double precoVenda; 

    public Integer getCodItensVenda() {
        return codItensVenda;
    }

    public void setCodItensVenda(Integer codItensVenda) {
        this.codItensVenda = codItensVenda;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Integer getVenda() {
        return venda;
    }

    public void setVenda(Integer venda) {
        this.venda = venda;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Double getPrecoVenda() {
        return precoVenda;
    }

    public void setPrecoVenda(Double precoVenda) {
        this.precoVenda = precoVenda;
    }

    
    
}
