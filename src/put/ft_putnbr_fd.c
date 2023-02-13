/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/15 18:42:39 by eguelin           #+#    #+#             */
/*   Updated: 2023/01/28 12:35:19 by eguelin          ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putnbr_fd(int n, int fd)
{
	unsigned int	n_unsigned;

	if (n < 0)
	{
		n_unsigned = n * -1;
		ft_putchar_fd('-', fd);
	}
	else
		n_unsigned = n;
	if (n_unsigned >= 10)
		ft_putnbr_fd(n_unsigned / 10, fd);
	ft_putchar_fd((n_unsigned % 10) + 48, fd);
}
